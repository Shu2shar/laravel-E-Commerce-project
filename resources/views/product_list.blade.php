@extends('layout_user')
@section('content')
    <!-- Header-->
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">Shop in style</h1>
                <p class="lead fw-normal text-white-50 mb-0">With E-commerce Store</p>
            </div>
        </div>
    </header>

    <!-- Filters-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="card box" style="width: 75rem;">
                <h5 class="card-header">FILTER BY</h5>
                <div class="card-body">
                    <form name="search_by_detail" action="{{ route('product_list') }}" method="get"
                        enctype="multipart/form-data">
                        <div class="form-row">
                            <div class="form-group col-md m-1">
                                <label><b>Gender:</b></label>
                                <select class="form-select" name="gender" id="gender">
                                    <option value="">Select</option>
                                    <option value="male" {{ request('gender') == 'male' ? 'selected' : '' }}>Male</option>
                                    <option value="female" {{ request('gender') == 'female' ? 'selected' : '' }}>Female
                                    </option>
                                    <option value="children" {{ request('gender') == 'children' ? 'selected' : '' }}>
                                        Children</option>
                                    <option value="unisex" {{ request('gender') == 'unisex' ? 'selected' : '' }}>Unisex
                                    </option>
                                </select>
                            </div>

                            <div class="form-group col-md m-1">
                                <label><b>Price:</b></label>
                                <select class="form-select" name="price" id="price">
                                    <option value="">Select</option>
                                    <option value="less_than_1500"
                                        {{ request('price') == 'less_than_1500' ? 'selected' : '' }}>Less than ₹1500
                                    </option>
                                    <option value="between_1500_5k"
                                        {{ request('price') == 'between_1500_5k' ? 'selected' : '' }}>₹1500 - ₹5000</option>
                                    <option value="between_5k_10k"
                                        {{ request('price') == 'between_5k_10k' ? 'selected' : '' }}>₹5000 - ₹10,000
                                    </option>
                                    <option value="between_10k_30k"
                                        {{ request('price') == 'between_10k_30k' ? 'selected' : '' }}>₹10,000 - ₹30,000
                                    </option>
                                    <option value="greater_than_30k"
                                        {{ request('price') == 'greater_than_30k' ? 'selected' : '' }}>More than ₹30,000
                                    </option>
                                </select>
                            </div>

                            <div class="form-group col-md m-1">
                                <label><b>Color:</b></label>
                                <select class="form-select" name="color" id="color">
                                    <option value="">Select</option>
                                    @foreach (\Illuminate\Support\Facades\Config::get('colors') as $value)
                                        <option value="{{ $value }}"
                                            {{ request('color') == $value ? 'selected' : '' }}>{{ $value }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="form-group col-md m-1">
                                <label><b>Function:</b></label>
                                <select class="form-select" name="function" id="function">
                                    <option value="">Select</option>
                                    @foreach (\Illuminate\Support\Facades\Config::get('watch_functions') as $value)
                                        <option value="{{ $value }}"
                                            {{ request('function') == $value ? 'selected' : '' }}>{{ $value }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="form-group col-md m-1">
                                <label><b>Brand:</b></label>
                                <select class="form-select" name="brand" id="brand">
                                    <option value="">Select</option>
                                    @foreach ($brands as $key => $value)
                                        <option value="{{ $key }}"
                                            {{ request('brand') == $key ? 'selected' : '' }}>
                                            {{ Str::of($value)->replace('_', ' ')->title()->value() }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="form-group col-md m-1">
                                <label><b>Sort By:</b></label>
                                <select class="form-select" name="sort_by" id="sort_by">
                                    <option value="">Select</option>
                                    <option value="lower_to_higher"
                                        {{ request('sort_by') == 'lower_to_higher' ? 'selected' : '' }}>Price Lower to
                                        Higher</option>
                                    <option value="higher_to_lower"
                                        {{ request('sort_by') == 'higher_to_lower' ? 'selected' : '' }}>Price Higher to
                                        Lower</option>
                                    <option value="model_a_z" {{ request('sort_by') == 'model_a_z' ? 'selected' : '' }}>
                                        Model (A-Z)</option>
                                    <option value="model_z_a" {{ request('sort_by') == 'model_z_a' ? 'selected' : '' }}>
                                        Model (Z-A)</option>
                                </select>
                            </div>
                        </div>

                        <div class="text-center mt-3">
                            <input type="submit" class="btn btn-success btn-sm" value="Search"
                                style="width:8rem;color: #ffffff">
                            <a href="{{ route('product_list') }}" class="btn btn-warning btn-sm"
                                style="width:8rem;color: #ffffff">Clear Filters</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Products Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                @foreach ($products as $product)
                    <div class="col mb-5">
                        <div class="card h-100">
                            @if (!empty($product->sale_price) && $product->stock != 0)
                                <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">
                                    Sale</div>
                            @elseif($product->stock == 0)
                                <div class="badge bg-danger text-white position-absolute"
                                    style="top: 0.5rem; right: 0.5rem">Out Of Stock</div>
                            @endif

                            <img class="card-img-top" src="{{ $product->image }}" alt="Product Image" />

                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">{{ $product->product_name }}</h5>
                                    @if (!empty($product->sale_price))
                                        <span
                                            class="text-muted text-decoration-line-through">{{ '₹' . $product->price }}</span>
                                        {{ '₹' . $product->sale_price }}
                                    @else
                                        {{ '₹' . $product->price }}
                                    @endif
                                </div>
                            </div>

                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto"
                                        href="{{ route('product_info', ['product' => $product->product_code]) }}">View
                                        Product</a>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>

            <!-- Pagination -->
            <div class="d-flex justify-content-center mt-4">
                {!! $products->appends(request()->query())->links() !!}
            </div>
        </div>
    </section>

    @include('store_locator')
@endsection

@section('css')
    <style>
        .form-group {
            margin-bottom: 1rem;
        }

        .form-inline .form-control {
            display: inline-block;
            width: auto;
            vertical-align: middle;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            margin-right: -5px;
            margin-left: -5px;
        }

        label {
            margin-bottom: 0.5rem;
        }

        .pagination~p.small.text-muted,
        .small.text-muted {
            display: none !important;
        }
    </style>
@endsection
