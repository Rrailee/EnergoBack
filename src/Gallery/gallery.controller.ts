import { Controller, Get, Param } from '@nestjs/common';
import { GalleryService } from './gallery.service';
import { Type } from '@prisma/client';

@Controller()
export class GalleryController {
  constructor(private readonly galleryService: GalleryService) {}

  @Get("/gallery")
  GetImages(@Param("ImageType") ImageType: Type ){
    return this.galleryService.GetForType(ImageType)
  }
  
}
