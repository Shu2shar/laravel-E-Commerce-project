<?php

namespace App\Http\Controllers;

use App\Enum\Roles;
use App\Events\WelcomeEmail;
use App\Models\country;
use App\Models\User;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AdminController extends Controller
{
    public function index(Request $request)
    {
        return view('admin.index');
    }


    public function usersListDashboard(Request $request)
    {
        $users = User::all();
        return view('admin.users_list', compact('users'));
    }

    public function editUsers(Request $request, $id)
    {
        $user = User::find($id);
        $countries = country::all();
        if (empty($user)) {
            return redirect()->route('users_list_dashboard')->with('danger', 'User not found.');
        }
        return view('admin.user_edit', compact('user', 'countries'));
    }

    public function updateUsers(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'fname' => 'min:4|max:15|required',
            'lname' => 'min:4|max:15|different:fname|nullable',
            'email' => 'required|email',
            'mobile' => 'numeric|digits:10|digits_between:10,12|nullable',
            'gender' => 'required|in:Male,Female',
            'role_id' => 'required|in:0,1',
            'address' => 'required|min:5|max:100',
            'country' => 'required',
        ]);
        $requestData = $request->except(['_token', '_method', 'update']);
        $user = User::find($id);
        if (!empty($user)) {
            $user->update($requestData);
            return redirect()->route('users_list_dashboard')->with('success', 'Profile has been updated successfully by Admin.');
        } else {
            return redirect()->route('users_list_dashboard')->with('danger', 'Something went wrong, please try again.');
        }
    }

    public function updateUsersProfile(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'profile_image' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);

        $requestData = $request->except(['_token', '_method', 'update']);
        $imageName = 'lv_' . rand() . '.' . $request->profile_image->extension();
        $request->profile_image->move(public_path('images/'), $imageName);
        $requestData['profile_image'] = $imageName;
        // Step 2: Get current user
        $user = User::find($id);

        // Step 4: Save new image
        if (!empty($user)) {
            $existingProfieImage = $user->profile_image;
            // Step 5: Update user record
            $user->update($requestData);
            $profileExists = public_path('images/' . $existingProfieImage);
            if (file_exists($profileExists) && !empty($existingProfieImage)) {
                unlink($profileExists); // deletes the old image file
            }
            return redirect()->route('users_list_dashboard')->with('success', 'Profile image has been updated successfully by Admin.');
        } else {
            return redirect()->route('users_list_dashboard')->with('danger', 'Something went wrong, please try again.');
        }
    }

    public function registerUsersProfile(Request $request)
    {
        $countries = country::all();
        return view('admin.users_register', compact('countries'));
    }

    public function registerUsersProfileData(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'fname' => 'min:4|max:10|required',
            'lname' => 'min:4|max:10|different:fname|nullable',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:6|',
            'mobile' => 'numeric|digits:10|digits_between:10,12|nullable',
            'gender' => 'required|in:Male,Female',
            'role_id' => 'required|in:0,1',
            'address' => 'required|min:5|max:100',
            'country' => 'required',
            'profile_image' => 'required|image|mimes:jpeg,png,jpg,gif,svg ',

        ]);

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        $requestData = $request->except(['_token', 'regist']);
        $imageName = 'lv_' . rand() . '.' . $request->profile_image->extension();
        $request->profile_image->move(public_path('images'), $imageName);
        $requestData['profile_image'] = $imageName;
        $requestData['password'] = bcrypt($request->password);

        if (!empty($requestData)) {
            $user = user::create($requestData);
            event(new WelcomeEmail($user));
            return redirect()->route('users_list_dashboard')->with('success', 'Data has been saved successfully.');
        } else {
            return redirect()->route('users_list_dashboard')->with('danger', 'Something went wrong, please try again.');
        }
    }


    public function changeUserStatus(Request $request, $id, $status = 1)
    {
        // dd($id);
        $user = User::find($id);

        if (!empty($user)) {
            // $user->is_active = $request->status ?? 1; one eway
            $user->is_active = $status; // another way
            $user->save();
            return redirect()->route('users_list_dashboard')->with('success', 'User Status update successfully by Admin.');
        } else {
            return redirect()->route('users_list_dashboard')->with('danger', 'Something went wrong, please try again.');
        }
    }
}
