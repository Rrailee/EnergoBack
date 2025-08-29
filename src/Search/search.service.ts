import { Injectable } from '@nestjs/common';
import { ExecutionService } from 'src/Execution/execution.service';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class SearchService {
  constructor(
    private readonly prismaService: PrismaService,
    private readonly executionService: ExecutionService,
  ) {}

  async MainSearch(qu: string) {
    const result: Array<{
      type: string;
      id: number;
      name: string;
      url: string;
    }> = [];

    const drawings = await this.prismaService.drawing.findMany({
      where: {
        name: { contains: qu, mode: 'insensitive' },
      },
    });

    result.push(
      ...drawings.map((drawing) => ({
        type: "Drawing",
        id: drawing.id,
        name: drawing.name,
        url: `/products/${encodeURIComponent(drawing.name)}`,
      }))
    );

    // Поиск исполнений
    const executions = await this.prismaService.execution.findMany({
      where: {
        name: { contains: qu, mode: 'insensitive' },
      },
      include: {
        drawing: true, // включаем связь с чертежом
      },
    });

    result.push(
      ...executions.map((execution) => ({
        type: "Execution",
        id: execution.id,
        name: `${execution.name}`,
        url: `/products/${encodeURIComponent(execution.drawing.name)}/${encodeURIComponent(execution.name)}`,
      }))
    );

    // Поиск строк в таблице исполнений
    const lineTable = await this.prismaService.executionItem.findMany({
      where: {
        name: { contains: qu, mode: 'insensitive' },
      },
      include: {
        execution: {
          include: {
            drawing: true, // включаем связь с исполнением и чертежом
          },
        },
      },
    });

    result.push(
      ...lineTable.map((item) => ({
        type: "ExecutionItem",
        id: item.id,
        name: `${item.name}`,
        url: `/products/${encodeURIComponent(item.execution.drawing.name)}/${encodeURIComponent(item.execution.name)}`,
      }))
    );

    return result;
  }
}