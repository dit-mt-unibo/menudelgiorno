<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class RestaurantResource extends JsonResource
{
    public function toArray($request)
    {
        $user=$this->whenLoaded('user');
        return [
            'id' => $this->id,
            'name' => $this->name,
            'address' => $this->address,
            'street_number' => $this->street_number,
            'postcode' => $this->postcode,
            'city' => $this->city,
            'province' => $this->province,
            'menu'=> new MenuResource($this->whenLoaded('registry')),
            'user'=> new UserResource($user),
        ];
    }
}
