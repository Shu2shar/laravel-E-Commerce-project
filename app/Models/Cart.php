<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;

    protected $table = 'carts';

    protected $primaryKey = 'id';

    protected $fillable = [
        'user_id',
        'product_id',
        'quantity',
    ];

    public function getProductData()
    {
        return $this->hasOne(Product::class, 'id', 'product_id');
    }
    
    public function getUserId()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

}
