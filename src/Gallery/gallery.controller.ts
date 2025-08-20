import { Controller, Get, Param } from '@nestjs/common';
import { GalleryService } from './gallery.service';
import { Type } from '@prisma/client';

@Controller("gallery")
export class GalleryController {
  constructor(private readonly galleryService: GalleryService) {}

  @Get(":ImageType")
  GetImages(@Param("ImageType") ImageType: Type ){
    return this.galleryService.GetForType(ImageType)
  }
  
}
