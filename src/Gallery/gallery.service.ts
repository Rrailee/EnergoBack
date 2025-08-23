import { Injectable } from '@nestjs/common';
import { Type } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class GalleryService {
  constructor(private readonly prismaService: PrismaService) {}

  async GetForType(ImageType: Type, page: number = 1, limit: number = 16) {
    const skip = (page - 1) * limit;

    const images = await this.prismaService.image.findMany({
      where: {
        type: ImageType,
      },
      skip,
      take: limit,
    });

    const total = await this.prismaService.image.count({where: {
      type: ImageType
    }});

    return {
      data: images,
      meta: {
        currentPage: page,
        itemsPerPage: limit,
        totalItems: total,
        totalPages: Math.ceil(total / limit),
      },
    };
  }
}
