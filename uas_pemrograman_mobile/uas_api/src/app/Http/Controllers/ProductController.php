<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $koneksi = DB::connection("mysql")->table("products")->select('id', 'name','price','category','tag','image')->get();
        return response()->json($koneksi, 200);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $req)
    {
        try {
            $validasi = Validator::make(
                $req->all(),
                [
                    'name' => 'required|string|max:255',
                    'price' => 'required|numeric|min:8',
                    'category' => 'required|string|max:255',
                    'tag' => 'required|string|max:255',
                    'image' => 'required|string|max:255',
                ],
            );
            if ($validasi->fails()) {
                return response()->json($validasi->errors(), 422);
            }
            $credential = new Product();
            $credential->name = $req->name;
            $credential->price = $req->price;
            $credential->category = $req->category;
            $credential->tag = $req->tag;
            $credential->image = $req->image;
            $credential->save();
            $response = [
                'status' => 200,
                'message' => 'add product success',
                'data' => $credential,
            ];
            return response()->json($response);
        } catch (\Throwable $th) {
            $response = ['status' => 500, 'message' => $th];
        }
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
    public function show(Product $product)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Product $product)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Product $product)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Product $product)
    {
        //
    }
}
