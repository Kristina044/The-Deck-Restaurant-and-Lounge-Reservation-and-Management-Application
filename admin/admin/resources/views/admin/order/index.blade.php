@extends('admin.layout.welcome')
@section('title')
List Order
@endsection

@push('js')
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    function confirmDelete(event, id) {
        event.preventDefault();
        Swal.fire({
            title: 'Are you sure?',
            text: 'You will not be able to recover this data!',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Yes, delete it!',
            cancelButtonText: 'Cancel'
        }).then((result) => {
            if (result.isConfirmed) {
                document.getElementById('delete-form-' + id).submit();
            }
        });
    }
</script>
@endpush

@section('content')
<div class="container-fluid pt-4 px-4">
    <div class="bg-light rounded h-100 p-4">
        <h5 class="mb-4">List Order</h5>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Code</th>
                        <th scope="col">Customer ID</th>
                        <th scope="col">Total</th>
                        <th scope="col">Note</th>
                        <th scope="col">Payment Method</th>
                        <th scope="col">Table ID</th>
                        <th scope="col">Pick Up Type</th>
                        <th scope="col">Proof Of Payment</th>
                        <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($orders as $order)
                    <tr>
                        <td>{{ $order['code'] }}</td>
                        <td>{{ $order['customer_id']  }}</td>
                        <td>{{ $order['total'] }}</td>
                        <td>{{ $order['note'] }}</td>
                        <td>{{ $order['payment_method']  }}</td> 
                        <td>{{ $order['table__id'] }}</td>
                        <td>{{ $order['pick_up_type']  }}</td> 
                        <td>{{ $order['proof_of_payment']  }}</td> 
                        <td>
                            @if($order['status'] == 0)
                                Pending
                            @elseif($order['status'] == 1)
                                Approve
                            @else
                                Unknown
                            @endif
                        </td>
                    </tr>
                    @endforeach
                </tbody>
                
            </table>
        </div>
    </div>
</div>
@endsection

{{-- @extends('admin.layout.welcome')
@section('title')
List Order
@endsection

@push('js')
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    function confirmDelete(event, id) {
        event.preventDefault();
        Swal.fire({
            title: 'Are you sure?',
            text: 'You will not be able to recover this data!',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Yes, delete it!',
            cancelButtonText: 'Cancel'
        }).then((result) => {
            if (result.isConfirmed) {
                document.getElementById('delete-form-' + id).submit();
            }
        });
    }
</script>
@endpush

@section('content')
<div class="container">
    <div class="row mb-3">
        <div class="col-md-3">
            <input type="text" id="search" class="form-control" placeholder="Search...">
        </div>
    </div>
    @if (Session::has('success_message'))
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Success: </strong> {{ Session::get('success_message') }}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endif

    @if (Session::has('message'))
    <div class="alert alert-info alert-dismissible fade show" role="alert">
        <strong>Message: </strong> {{ Session::get('message') }}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endif

    @if (Session::has('error_message'))
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <strong>Error: </strong> {{ Session::get('error_message') }}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endif

    <table border="2" class="table table-striped" id="table">
        <thead>
            <tr>
                <th scope="col">No</th>
                <th scope="col">Code</th>
                <th scope="col">Customer ID</th>
                <th scope="col">Total</th>
                <th scope="col">Note</th>
                <th scope="col">Payment Method</th>
                <th scope="col">Table ID</th>
                <th scope="col">Pick Up Type</th>
                <th scope="col">Proof Of Payment</th>
                <th scope="col">Status</th>

            </tr>
        </thead>
        <tbody>
            @foreach ($orders as $key => $order)
            <tr>
                <td>{{ $key + 1 }}</td>
                <td>{{ $order['code'] }}</td>
                <td>{{ $order['customer_id'] ?? 'N/A' }}</td>
                <td>{{ $order['total'] }}</td>
                <td>{{ $order['note'] }}</td>
                <td>{{ $order['payment_method'] ?? 'N/A' }}</td> 
                <td>{{ $order['table__id'] }}</td>
                <td>{{ $order['pick_up_type'] ?? 'N/A' }}</td> 
                <td>{{ $order['proof_of_payment'] ?? 'N/A' }}</td> 
                <td>
                    @if($order['status'] == 0)
                        Pending
                    @elseif($order['status'] == 1)
                        Approve
                    @else
                        Unknown
                    @endif
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection --}}
