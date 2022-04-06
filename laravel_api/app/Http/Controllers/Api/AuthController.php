<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use App\Models\Registry;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        // Validazione dei dati di registrazione
        // ottenuti dalla richiesta HTTP durante
        // la registrazione.
        $request->validate([
            'user' => 'required',
            'email' => 'required',
            'password' => 'required|confirmed',
            'role' => 'required',
        ]);

        // Creazione del nuovo utente.
        $newUser = User::create([
            'name' => $request->input('user'),
            'password' => Hash::make($request->input('password')),
            'role' => $request->input('role'),
        ]);

        // Creazione dei Dati Anagrafici iniziali del nuovo utente.
        $newRegistry = Registry::create([
            'email' => $request->input('email'),
            'user_id' => $newUser->input('id'),
        ]);


        // Ritorno una risposta di tipo JSON vuota
        // e con Status Code (201, Created) per notificare
        // la corretta creazione dell'utente.
        return response()
            ->json()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    public function login(Request $request)
    {
        // Validazione dei parametri ricevuti
        // dalla richiesta HTTP durante il login.
        $request->validate([
            'user' => 'required',
            'password' => 'required',
            'device' => 'required',
        ]);

        // Ricerca dell'utente in base all'attributo 'name'.
        $user = User::where('name', $request->input('user'))->first();

        // Verifica delle password tramite hash.
        if (!$user || !Hash::check($request->input('password'), $user->input('password'))) {
            throw ValidationException::withMessages([
                'message' => ['The provided credentials are incorrect.'],
            ]);
        }

        // Creazione di un token di accesso in base al nome del dispositivo.
        // Un utente può loggarsi da più dispositivi e, per identificare
        // il token di ciascun dispositivo, gli viene dato come nome quello
        // del dispositivo di login.
        $token = $user->createToken($request->device)->plainTextToken;

        // Risposta contenente i dati dell'utente ed il token di accesso.
        $response = [
            'user' => [
                'id' => $user->id,
                'user' => $user->name,
                'role' => $user->role,
            ],
            'token' => $token,
        ];

        return $response;
    }

    public function logout(Request $request)
    {
        // Ottengo l'utente corrente in base alla sua
        // chiave primaria ricevuta dalla richiesta HTTP.
        $user = User::find($request->id);

        // Elimino tutti i tokens associati all'utente.
        $user->tokens()->delete();

        // Ritorno una risposta di tipo JSON vuota
        // e con Status Code (200, OK) per notificare
        // la corretta eliminazione dei tokens.
        return response()
            ->json()
            ->setStatusCode(Response::HTTP_OK);
    }
}
