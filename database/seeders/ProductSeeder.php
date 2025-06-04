<?php

namespace Database\Seeders;

use App\Models\Brands;
use App\Models\Product;
use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use Illuminate\Support\Facades\Config;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create();

        $images = [
            'images/products/phone1.jpg',
            'images/products/phone2.jpg',
            'images/products/phone3.jpg',
            'images/products/phone4.jpg',
            'images/products/phone5.jpg',
            'images/products/phone6.jpg',
        ];
        foreach (range(1, 20) as $value) {
            Product::create([
                'name' => $faker->randomElement(Brands::pluck('name')) . ' Phone',
                'price' => $faker->numberBetween($min = 10000, $max = 100000),
                'sale_price' => $faker->numberBetween($min = 8000, $max = 30000),
                'color' => $faker->randomElement(['Gold', 'Rose Gold', 'Silver', 'Black', 'Beige', 'Blue', 'Green']),
                'brand_id' => $faker->randomElement(Brands::pluck('id')),
                'product_code' => $faker->numerify('BP-#####'),
                'gender' => $faker->randomElement(['male', 'female', 'children', 'unisex']),
                'function' => $faker->randomElement(Config::get('phone_features')),
                'stock' => $faker->randomDigit(),
                'description' => $faker->text($maxNbChars = 200),
                'image' => $faker->randomElement($images),
                // 'image' => $faker->imageUrl($width = 640, $height = 480),
                'is_active' => $faker->randomElement(['1', '0']),
            ]);
        }
    }
}
