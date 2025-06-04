<?php

namespace App\Http\Controllers;

use App\Models\Brands;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class BrandsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $brands = Brands::all();
        return view('admin.brands_list', compact('brands'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.add_brand');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'min:4|max:10|required|string',
            'description' => 'nullable|string|min:3|max:100',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg ',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        $requestData = $request->except(['_token', 'add']);
        $imageName = Str::snake($request->name) . '.' . $request->image->extension();
        $request->image->move(public_path('brands'), $imageName);
        $requestData['image'] = $imageName;
        $brand = Brands::create($requestData);
        if (!empty($requestData)) {
            $brand->update($requestData);
            return redirect()->route('brands.index')->with('success', 'Brands Data has been saved successfully.');
        } else {
            return redirect()->route('brands.index')->with('danger', 'Something went wrong, please try again.');
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Brands $brand)
    {
        dd(['Hellow Brands show']);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Brands $brand)
    {
        return view('admin.brand_edit', compact('brand'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Brands $brand)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'min:4|max:30|required|string',
            'description' => 'nullable|string|min:3|max:100',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }
        $brand->name = $request->name ?? $brand->name;
        $brand->description = $request->description ?? $brand->description;
        $brand->save();
        return redirect()->route('brands.index')->with('success', 'Brands Data has been updated successfully.');
        // dd($brand->toArray());
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Brands $brand)
    {
        dd(['Hellow Brands destroy']);
    }

    public function changeBrandImage(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'image' => 'required|mimes:jpg,jpeg,png',
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }
        $requestData = $request->except(['_token', '_method', 'update']);
        $brand = Brands::find($id);
        if (!empty($brand)) {
            $imgName = Str::snake($brand->name) . '.' . $request->image->extension();
            $request->image->move(public_path('brands/'), $imgName);
            $requestData['image'] = Str::snake($imgName);
            $brand->update($requestData);
            return redirect()->route('brands.index')->with('success', 'Brand Image Updated Successfully!');
        } else {
            return redirect()->route('brands.index')->with('danger', 'Something went wrong.');
        }
    }

    public function changeBrandStatus(Request $request, $id, $status = 1)
    {
        $brands = Brands::find($id);
        if (!empty($brands)) {
            $brands->is_active = $status;
            $brands->save();
            return redirect()->route('brands.index')->with('success', 'Brand status Updated Successfully!');
        } else {
            return redirect()->route('brands.index')->with('danger', 'Something went wrong.');
        }
    }
}
