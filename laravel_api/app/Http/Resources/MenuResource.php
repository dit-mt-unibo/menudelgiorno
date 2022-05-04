<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class MenuResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $translation=$this->whenLoaded('translation');
        $restaurant=$this->whenLoaded('restaurant');
        return [
            'id' => $this->id,
            'text' => $this->text,
            'restaurant_id'=>$this->restaurant_id,
            'restaurant'=> new RestaurantResource($restaurant),
            'translation'=> new TranslationResource($translation),
            // 'created_at' => $this->created_at,
            // 'updated_at' => $this->updated_at,
        ];
    }
}
