<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class SendForgotPasswordEmail extends Mailable
{
    use Queueable, SerializesModels;

    protected $emailData;

    public function __construct($emailData)
    {
        // dd($emailData);
        $this->emailData = $emailData;
    }

    public function build()
    {
        return $this->from('tgrsaab@gmail.com', 'Tushar')
            ->subject('Password Reset Request')
            ->view('emails.forgot_password_email')
            ->with([
                'token' => $this->emailData['token'],
                'email' => $this->emailData['email'],
                'expires_in' => config('auth.passwords.users.expire'),
            ]);
    }
}
