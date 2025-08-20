import { Controller, Get, Param } from '@nestjs/common';
import { Type } from '@prisma/client';
import { DrawingService } from './drawing.service';
import { ExecutionService } from 'src/Execution/execution.service';

@Controller('products')
export class DrawingController {
  constructor(
    private readonly drawingService: DrawingService,
    private readonly executionService: ExecutionService,
  ) {}

  @Get()
  GetImages() {
    return this.drawingService.GetAll();
  }

  @Get(':DrawName')
  async GetExecutions(@Param('DrawName') DrawName: string) {
    const DrawId = await this.drawingService.GetIdByName(DrawName);
    return this.executionService.GetManyByDrawingId(DrawId!.id)
  }
}
