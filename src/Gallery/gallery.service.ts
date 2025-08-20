import { Injectable } from '@nestjs/common';
import { Type } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class GalleryService {
  constructor(private readonly prismaService: PrismaService) {}

  GetForType(ImageType: Type) {
    return this.prismaService.image.findMany({ where : {
        type: ImageType
    }});
  }
}
