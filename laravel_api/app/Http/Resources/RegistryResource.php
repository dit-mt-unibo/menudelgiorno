<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class RegistryResource extends JsonResource
{
    public function toArray($request)
    {
        $user=$this->whenLoaded('user');
        return [
            'id' => $this->id,
            'first_name' => $this->first_name,
            'last_name' => $this->last_name,
            'email' => $this->email,
            'user'=> new UserResource($user),
            // 'user_id' => $this->user_id,
            // 'created_at' => $this->created_at,
            // 'updated_at' => $this->updated_at,
        ];
    }
}
