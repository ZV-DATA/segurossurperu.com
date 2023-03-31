<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use Illuminate\Http\Request;

class WebController extends Controller
{
    public function index()
    {
        return view('web.index');
    }

    public function consult(Request $request, $query_param = null)
    {
        $query = $request->query('query') ? $request->query('query') : $query_param;
        $customer = Customer::where('name', 'like', '%' . $query . '%')
            ->orWhere('certificate_number', 'like', '%' . $query . '%')
            ->orWhere('license_plate', 'like', '%' . $query . '%')
            ->first();

        return view('web.consult', compact('customer'));
    }
}
