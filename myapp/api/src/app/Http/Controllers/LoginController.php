<?php

namespace App\Http\Controllers;

use App\Models\Login;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LoginController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // $koneksi = DB::connection("mysql")->table("users")->get();
        $koneksi = DB::connection("mysql")->table("users")->select('id', 'name', 'email')->get();
        return response()->json($koneksi,200);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $req)
    {
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    // public function show($id)
    // {
    //     $koneksi = DB::connection("mysql")->table("users")->find($id);
    //     if ($koneksi == NULL) {
    //         return response()->json("data pada id=$id, tidak ada!", 404);
    //     } else {
    //         return response()->json($koneksi, 200);
    //     }
    // }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Login $login)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Login $login)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Login $login)
    {
        //
    }
}
