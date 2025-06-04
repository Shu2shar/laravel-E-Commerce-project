<?php

namespace App\Http\Controllers;

use App\Models\country;
use App\Models\Lineitem;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function userProfile(Request $request)
    {
        // Assuming you have a user model and the user is authenticated
        $user = Auth::user();
        $lineitems = Lineitem::where('user_id', $user->id)->orderBy('id', 'DESC')->get();
        $countries = country::all();
        

        // Return the user profile view with the user data
        return view('user_profile', compact('user', 'countries', 'lineitems'));
    }

    public function userProfileUpdate(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'fname' => 'min:4|max:15|required',
            'lname' => 'min:4|max:15|different:fname|nullable',
            'email' => 'required|email',
            'mobile' => 'numeric|digits:10|digits_between:10,12|nullable',
            'gender' => 'required|in:Male,Female',
            'address' => 'required|min:5|max:100',
            'country' => 'required',
        ]);
        $requestData = $request->except(['_token', '_method', 'update']);
        $user = User::find(Auth::User()->id);
        $user->update($requestData);
        return redirect()->route('user_profile')->with('success', 'Profile has been updated successfully.');
    }
    

    public function userProfileImageUpdate(Request $request)
    {
        // Step 1: Validate image
        $request->validate([
            'profile_image' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);

        // Step 2: Get current user
        $user = User::find(Auth::id());

        // Step 3: Delete old image from folder if exists
        if ($user->profile_image) {
            $oldImagePath = public_path('images/' . $user->profile_image);
            if (file_exists($oldImagePath)) {
                unlink($oldImagePath); // deletes the old image file
            }
        }

        // Step 4: Save new image
        $imageName = 'lv_' . rand() . '.' . $request->profile_image->extension();
        $request->profile_image->move(public_path('images'), $imageName);

        // Step 5: Update user record
        $user->profile_image = $imageName;
        $user->save();

        // Step 6: Redirect with success message
        return redirect()->route('user_profile')->with('success', 'Profile image updated successfully.');
    }
}
