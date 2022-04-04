<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class TranslationResource extends JsonResource
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
            'text' => $this->text,
            'language_id' => $this->language_id,
            'language_name' => $this->language->name,//oggetto lingue
            'created_at' => $this->created_at,

            // 'menu_id'=>$this->menu_id,
            // 'user_id'=>$this->user_id,

            // 'updated_at' => $this->updated_at,
        ];
    }
}
