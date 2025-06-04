<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Enum\Roles;
use App\Events\WelcomeEmail;
use App\Mail\SendForgotPasswordEmail;
use App\Models\country;
use App\Models\user;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Mockery\Generator\StringManipulation\Pass\Pass;

class AuthenticationController extends Controller
{
    public function register(Request $request)
    {
        $countries = country::all();
        // dd($countries);
        return view('register', compact('countries'));
    }

    public function storeUser(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'fname' => 'min:4|max:10|required',
            'lname' => 'min:4|max:10|different:fname|nullable',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:6|',
            'mobile' => 'numeric|digits:10|digits_between:10,12|nullable',
            'gender' => 'required|in:Male,Female',
            'address' => 'required|min:5|max:100',
            'country' => 'required',
            'profile_image' => 'required|image|mimes:jpeg,png,jpg,gif,svg ',

        ]);

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        // dd($request->all());

        $requestData = $request->except(['_token', 'regist']);
        $imageName = 'lv_' . rand() . '.' . $request->profile_image->extension();
        $request->profile_image->move(public_path('images'), $imageName);
        $requestData['profile_image'] = $imageName;

        $requestData['password'] = bcrypt($request->password);

        $requestData['role_id'] = Roles::USER; // Assuming you have a Roles enum defined
        $user = user::create($requestData);
        event(new WelcomeEmail($user));
        return redirect()->route('login')->with('success', 'Data has been saved successfully.');
    }

    public function login(Request $request)
    {
        return view('login');
    }

    public function Authenticate(Request $request)
    {

        // dd($request->all());
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }



        $credentials = $request->only('email', 'password');
        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            if (Auth::user()->role_id == Roles::ADMIN->value) {
                return redirect()->route('admin_home')->with('success', 'Admin Login Successful');
            } else {
                return redirect()->route('home')->with('success', 'Login Successful');
            }
        } else {
            return back()->with('danger', 'Invalid credentials, please try again.')->withInput();
        }
    }



    public function forgotPassword(Request $request)
    {
        return view('forgot_password');
    }

    public function SendForgotPasswordEmail(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email',
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }
        $requestData = $request->except(['_token', '_method', 'forgot_pass_btn']);
        $requestData['token'] = Str::random(30);

        // Store token in DB
        DB::table('password_reset_tokens')->Insert($requestData);
        Mail::to($requestData['email'])->send(new SendForgotPasswordEmail($requestData));
        return redirect()->route('forgot_password')->with('success', 'Reset password link has been sent!');
    }



    public function ResetPassword(Request $request, $token)
    {

        // dd([$request->all(), $token]);
        $tokenData = DB::table('password_reset_tokens')
            ->where('email', $request->email)
            ->where('token', $request->token)
            ->first();

        if ($tokenData) {
            // Check if token is expired (older than 60 minutes)
            if (Carbon::parse($tokenData->created_at)->addMinutes(60)->isPast()) {
                DB::table('password_reset_tokens')
                    ->where('email', $request->email)
                    ->where('token', $token) // use token from URL
                    ->delete();

                return redirect()->route('login')->with('danger', 'Reset link expired. Please try again.');
            }

            return view('reset_password', ['email' => $request->email]);
        } else {
            return redirect()->route('login')->with('danger', 'Invalid reset link.');
        }
    }


    public function resetPasswordData(Request $request)
    {

        // dd($request->all());
        $validator = Validator::make($request->all(), [
            'password' => 'required|min:6',
            'password_confirmation' => 'required|min:6|same:password',
        ]);

        // if ($validator->fails()) {
        //     return redirect()->back()->withInput()->withErrors($validator);
        // }

        // Check if token exists
        $tokenData = DB::table('password_reset_tokens')
            ->where('email', $request->email)
            ->first();

        if (!$tokenData) {
            return redirect()->route('login')->with('danger', 'Invalid or expired reset link.');
        }

        // Update user's password
        User::where('email', $request->email)
            ->update(['password' => bcrypt($request->password)]);

        // Delete the token so it can't be reused
        DB::table('password_reset_tokens')
            ->where('email', $request->email)
            ->delete();

        return redirect()->route('login')->with('success', 'Password has been reset successfully.');
    }


    public function logout(Request $request)
    {
        Session::flush();
        Auth::logout();
        return redirect()->route('login')->with('success', 'Logout Successfully');
    }
}
