import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class ExecutionService {
  constructor(private readonly prismaService: PrismaService) {}

  async GetManyByDrawingId(id: number) {

    const Execut = await this.prismaService.execution.findMany({
      where: {
        drawingId: id,
      },
      select:{
        name: true,
        description: true,
        imageurls: true
      }
    });


    return {
      data: Execut.map(item => ({
        name: item.name,
        description: item.description,
        imageurl: item.imageurls[0]
      }))
    };
  }

  GetByID(id: number) {
    return this.prismaService.execution.findFirst({
      where: { id },
    });
  }

  GetByName(Execname: string) {
    return this.prismaService.execution.findFirst({
      where: {
        name: Execname,
      },
    });
  }

  GetIdByName(Execname: string) {
    return this.prismaService.execution.findFirst({
      where: {
        name: Execname,
      },
      select: { id: true },
    });
  }

  async GetTableByID(ExecId: number, page: number = 1, limit: number = 10, qu: string = 'КП') {
    const skip = (page - 1) * limit;

    const lines = await this.prismaService.executionItem.findMany({
      where: {
        name: {contains: qu, mode: 'insensitive'},
        executionId: ExecId,
      },
      skip,
      take: limit,
    });
    const total = await this.prismaService.executionItem.count({
      where: { executionId: ExecId },
    });

    return {
      data: lines,
      meta: {
        currentPage: page,
        itemsPerPage: limit,
        totalItems: total,
        totalPages: Math.ceil(total / limit),
      },
    };
  }
}
