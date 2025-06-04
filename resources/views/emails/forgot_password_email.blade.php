<!DOCTYPE html>
<html>

<head>
    <title>Password Reset</title>
</head>

<body>
    <h2>Password Reset Request</h2>

    <p>Hello,</p>

    <p>We received a request to reset the password for your account ({{ $email }}).</p>

    <p>
        Click the button below to reset your password:
    </p>

    <p>
        <a href="{{ url('reset-password', ['token' => $token]) . '?email=' . urlencode($email) }}"
            style="padding: 10px 20px; background: #007bff; color: white; text-decoration: none;">Reset Password</a>
    </p>

    <p>If you did not request a password reset, no further action is required.</p>

    <p>Thanks,<br>The Team</p>

    <p>This reset link will expire in {{ $expires_in }} minutes.</p>

</body>

</html>
