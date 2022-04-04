<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Carbon\Carbon;

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
            'language' => new LanguageResource($this->whenLoaded('language')),
            'menu' => new MenuResource($this->whenLoaded('menu')),
            'elapsed_time' => $this->created_at->diffForHumans(),


            // 'menu_id'=>$this->menu_id,
            // 'user_id'=>$this->user_id,
            //'language_id' => $this->language_id,
           // 'language_name' => $this->language->name,//oggetto lingue
            // 'updated_at' => $this->updated_at,
        ];
    }
}
