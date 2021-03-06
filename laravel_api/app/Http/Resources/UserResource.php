<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
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
            'name'=>$this->name,
            'role'=>$this->role,
            'registry' => new RegistryResource($this->whenLoaded('registry')),
            'restaurant' => new RestaurantResource($this->whenLoaded('restaurant')),
            'translation' => new RestaurantResource($this->whenLoaded('translation')),
        ];
    }
}
