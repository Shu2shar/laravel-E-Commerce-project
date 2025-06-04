@extends('admin.layout')
@section('content')
    <main>
        <div class="container-fluid">
            <h1 class="mt-4">Users</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="{{ route('admin_home') }}">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="{{ route('users_list_dashboard') }}">User List</a></li>
                <li class="breadcrumb-item active">Users</li>
            </ol>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table me-1"></i>
                    Register User
                </div>
                <div class="card-body">
                    @include('flash_data')
                    <div class="album py-5" style="height: 120vh;">
                        <div class="row h-100 justify-content-center align-items-center">
                            <div class="card border-success" style="max-width: 65rem; padding: 2%;">
                                <div>
                                    <h2>Registration By Admin</h2>
                                    
                                </div>

                                <hr>

                                <div class="card-body">
                                    <form method="POST" action="{{ route('admin_user_profile_register_data') }}" enctype="multipart/form-data">
                                        @csrf
                                        <div class="row mb-3">
                                            <div class="col">
                                                <label for="fname" class="form-label">First Name</label>
                                                <input type="text" class="form-control" id="fname" name="fname"
                                                    placeholder="Meet" required="" value="{{ old('fname') }}">
                                                @error('fname')
                                                    <small class="text-danger">{{ $message }}</small>
                                                @enderror
                                            </div>
                                            <div class="col">
                                                <label for="lname" class="form-label">Last Name</label>
                                                <input type="text" class="form-control" id="lname" name="lname"
                                                    placeholder="Shah" required="" value="{{ old('lname') }}">
                                                @error('lname')
                                                    <small class="text-danger">{{ $message }}</small>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col">
                                                <label for="email" class="form-label">Email</label>
                                                <input type="email" class="form-control" id="email" name="email"
                                                    placeholder="name@example.com" required=""
                                                    value="{{ old('email') }}">
                                                @error('email')
                                                    <small class="text-danger">{{ $message }}</small>
                                                @enderror
                                            </div>
                                            <div class="col">
                                                <label for="mobile" class="form-label">Contact Number</label>
                                                <input type="tel" class="form-control" id="mobile" name="mobile"
                                                    placeholder="1234567890" required="" value="{{ old('mobile') }}">
                                                @error('mobile')
                                                    <small class="text-danger">{{ $message }}</small>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col">
                                                <label for="password" class="form-label">Password</label><br>
                                                <input type="password" class="form-control" id="password" name="password"
                                                    placeholder="password" required="">
                                                @error('password')
                                                    <small class="text-danger">{{ $message }}</small>
                                                @enderror
                                            </div>
                                            <div class="col">
                                                <label for="gender" class="form-label">Gender</label><br>
                                                <input type="radio" id="gender" name="gender" value="Male"
                                                    {{ old('gender') == 'Male' ? 'checked' : '' }}>&nbsp;&nbsp;Male&nbsp;&nbsp;
                                                <input type="radio" id="gender" name="gender" value="Female"
                                                    {{ old('gender') == 'Female' ? 'checked' : '' }}>&nbsp;&nbsp;Female
                                            </div>
                                            <div class="col">
                                                <label for="gender" class="form-label">Role</label><br>
                                                <input type="radio" id="role_id" name="role_id" value="1"
                                                    {{ old('role_id') == '1' ? 'checked' : '' }}>&nbsp;&nbsp;Admin&nbsp;&nbsp;
                                                <input type="radio" id="role_id" name="role_id" value="0"
                                                    {{ old('role_id') == '0' ? 'checked' : '' }}>&nbsp;&nbsp;User
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col">
                                                <label for="address" class="form-label">Address</label>
                                                <textarea class="form-control" id="address" rows="3" name="address" placeholder="address" required="">{{ old('address') }}</textarea>
                                                @error('address')
                                                    <small class="text-danger">{{ $message }}</small>
                                                @enderror
                                            </div>
                                            <div class="col">
                                                <label for="inputCountry" class="form-label">Country</label>
                                                <select class="form-select" id="inputCountry" name="country" required>
                                                    <option selected disabled>Select</option>
                                                    @foreach ($countries as $country)
                                                        <option value="{{ $country->name }}"
                                                            {{ old('country') == $country->name ? 'selected' : '' }}>
                                                            {{ $country->name }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                                @error('country')
                                                    <small class="text-danger">{{ $message }}</small>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col">
                                                <label for="profile_image" class="form-label">Profile</label><br>
                                                <input type="file" class="form-control-file" name="profile_image"
                                                    id="profile_image">
                                                @error('profile_image')
                                                    <br><small class="text-danger">{{ $message }}</small>
                                                @enderror
                                            </div>
                                        </div>
                                        <br>
                                        <div class="mb-3">
                                            <input type="submit" name="regist" id="regist" value="Register"
                                                class="btn btn-outline-success">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection
