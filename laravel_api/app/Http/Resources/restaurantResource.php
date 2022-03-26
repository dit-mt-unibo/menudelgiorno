<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class restaurantResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'address' => $this->address,
            'street_number' => $this->street_number,
            'postcode' => $this->postcode,
            'city' => $this->city,
            'province' => $this->province,
            'user_id' => $this->user_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
