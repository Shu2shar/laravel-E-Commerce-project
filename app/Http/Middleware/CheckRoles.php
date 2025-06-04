<?php

namespace App\Http\Middleware;

use App\Enum\Roles;
use App\Models\User;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CheckRoles
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {

        // if(Auth::check() && Auth::user()->role_id != Roles::ADMIN->value) {
        //     return redirect()->route('home', [], 301);
        // }
        // return $next($request);


        if (Auth::check() && Auth::user()->role_id == 1) {
            return $next($request);
        }

        return redirect()->route('home')->with('error', 'Access Denied');
    }
}
