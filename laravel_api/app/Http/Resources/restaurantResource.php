<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class RestaurantResource extends JsonResource
{
    public function toArray($request)
    {
        $menu=$this->whenLoaded('menu');
        return [
            'id' => $this->id,
            'name' => $this->name,
            'address' => $this->address,
            'street_number' => $this->street_number,
            'postcode' => $this->postcode,
            'city' => $this->city,
            'province' => $this->province,
            'menu'=> new MenuResource($menu),
        ];
    }
}
