import { Controller, Get, Param } from '@nestjs/common';
import { GalleryService } from './gallery.service';
import { Type } from '@prisma/client';

@Controller("gallery")
export class GalleryController {
  constructor(private readonly galleryService: GalleryService) {}

  @Get(":ImageType")
  async GetImages(@Param("ImageType") ImageType: Type ){
    const res = await this.galleryService.GetForType(ImageType)
    return {
      data: res.data.map(item => ({
      id: item.id,
      url: item.url,
    })),
    meta: res.meta
    }
  }
  
}
