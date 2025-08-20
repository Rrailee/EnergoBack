import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class ExecutionService {
  constructor(private readonly prismaService: PrismaService) {}

  GetManyByDrawingId(id: number) {
    return this.prismaService.execution.findMany({
        where: {
            drawingId: id
        }
    });
  }

  GetByID(id: number) {
    return this.prismaService.execution.findFirst({
      where: { id },
    });
  }

  GetByName(Execname: string){
    return this.prismaService.execution.findFirst({
        where: {
            name: Execname
        }
    })
  }
}
