<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
        <div class="nav">
            <a class="nav-link" href="{{ route('admin_home') }}">
                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                Dashboard
            </a>
            <a class="nav-link" href="{{ route('users_list_dashboard') }}">
                <div class="sb-nav-link-icon"><i class="fa fa-users" aria-hidden="true"></i></div>
                Users
            </a>
            <a class="nav-link" href="{{ route('brands.index') }}">
                <div class="sb-nav-link-icon"><i class="fa fa-list" aria-hidden="true"></i></div>
                Brands
            </a>
            <a class="nav-link" href="{{ route('product.index') }}">
                <div class="sb-nav-link-icon"><i class="fa fa-archive" aria-hidden="true"></i></div>
                Products
            </a>
            <a class="nav-link" href="{{ route('list_orders') }}">
                <div class="sb-nav-link-icon"><i class="fa fa-truck" aria-hidden="true"></i></div>
                Orders
            </a>
            <a class="nav-link" href="{{ route('admin_home') }}">
                <div class="sb-nav-link-icon"><i class="fa fa-tag" aria-hidden="true"></i></div>
                Discounts
            </a>
            <a class="nav-link" href="{{ route('admin_home') }}">
                <div class="sb-nav-link-icon"><i class="fa fa-credit-card" aria-hidden="true"></i></div>
                Transactions
            </a>
            <a class="nav-link" href="{{ route('home') }}">
                <div class="sb-nav-link-icon"><i class="fa fa-link" aria-hidden="true"></i></div>
                Visit Site
            </a>
        </div>
    </div>
    <div class="sb-sidenav-footer">
        <div class="small">Logged in as:</div>
        E-commerce Admin
    </div>
</nav>
