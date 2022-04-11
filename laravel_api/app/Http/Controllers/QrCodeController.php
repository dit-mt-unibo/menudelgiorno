<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\Translation;
use Illuminate\Http\Request;


class QrCodeController extends Controller
{
    public function index($id)
    {

        $data = Menu::findOrFail($id);
      return view('qrcode',compact('data'));
    }
}
