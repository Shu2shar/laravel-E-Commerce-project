<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    use HasFactory;
    protected $table = 'comments'; // Specify the table name if it's not 'comments'

    protected $fillable = [
        'user_id',
        'comment',
        // Add other fields here if needed
    ];
}
