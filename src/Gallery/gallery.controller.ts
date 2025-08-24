import { Controller, Get, Param, Query } from '@nestjs/common';
import { GalleryService } from './gallery.service';
import { Type } from '@prisma/client';

@Controller('gallery')
export class GalleryController {
  constructor(private readonly galleryService: GalleryService) {}

  @Get(':ImageType')
  async GetImages(
    @Param('ImageType') ImageType: Type,
    @Query('page') page: string = "1",
    @Query('limit') limit: string = "16",
  ) {
    const res = await this.galleryService.GetForType(ImageType, parseInt(page), parseInt(limit));
    return {
      data: res.data.map((item) => ({
        id: item.id,
        url: item.url,
      })),
      meta: res.meta,
    };
  }
}
