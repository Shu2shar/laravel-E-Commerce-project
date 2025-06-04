<?php

namespace App\Listeners;

use App\Events\WelcomeEvent;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Mail;
use App\Mail\WelcomeEmail as WelcomeEmailMailable;
use App\Jobs\SendWelcomeEmail;
use Illuminate\Support\Facades\Log;

class WelcomeEmailListener implements ShouldQueue
{

    // public $queue = 'welcome_email';
    public $queue = 'listener';
    /**
     * Create the event listener.
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     */
    public function handle($event): void
    {
        $user = $event->user;
        $emailData = [
            'subject' => 'Welcome to Our Platform',
            'greeting' => 'Hello ' . $user->fname . ' ' . $user->lname,
            'body' => 'Thank you for registering with us. We are excited to have you on board!',
            'thanks' => 'Thank you for choosing our platform.',
            'actionText' => 'Visit Dashboard',
            'actionURL' => url('/dashboard'),
        ];
        // Mail::to($user->email)->send(new WelcomeEmailMailable($emailData));


        // Log::info('WelcomeEmailListener running for user: ' . $event->user->email);
        // Dispatch the job instead of sending directly
        SendWelcomeEmail::dispatch($user, $emailData);
    }
}
