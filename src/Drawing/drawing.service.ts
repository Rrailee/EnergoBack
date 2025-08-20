import { Injectable } from '@nestjs/common';
import { response } from 'express';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class DrawingService {
  constructor(private readonly prismaService: PrismaService) {}

  GetAll() {
    return this.prismaService.drawing.findMany();
  }

  GetByID(id: number) {
    return this.prismaService.drawing.findFirst({
      where: { id },
    });
  }

  GetByName(Drawname: string){
    return this.prismaService.drawing.findFirst({
        where: {
            name: Drawname
        }
    })
  }

  GetIdByName(Drawname: string){
    return this.prismaService.drawing.findFirst({
        where: {name: Drawname}, 
        select: {id: true}
    })
  }
}
