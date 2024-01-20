<?php

namespace App\Http\Controllers;

use App\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class TagController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $koneksi = DB::connection("mysql")->table("tags")->select('id', 'name')->get();
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
                ],
            );
            if ($validasi->fails()) {
                return response()->json($validasi->errors(), 422);
            }
            $credential = new Tag();
            $credential->name = $req->name;
            $credential->save();
            $response = [
                'status' => 200,
                'message' => 'add tag success',
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
    public function show(Tag $tag)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Tag $tag)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Tag $tag)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Tag $tag)
    {
        //
    }
}
