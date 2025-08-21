import { Controller, Get, Param } from '@nestjs/common';
import { DrawingService } from './drawing.service';
import { ExecutionService } from 'src/Execution/execution.service';

@Controller('products')
export class DrawingController {
  constructor(
    private readonly drawingService: DrawingService,
    private readonly executionService: ExecutionService,
  ) {}

  @Get()
  async GetAllNames() {
    const res = await this.drawingService.GetAll();
    return res.map((item) => ({
      name: item.name,
    }));
  }

  @Get(':DrawName')
  async GetExecutions(@Param('DrawName') DrawName: string) {
    const Draw = await this.drawingService.GetByName(DrawName);
    const execution =  (await this.executionService.GetManyByDrawingId(Draw!.id)).map((item) => ({
      name: item.name,
      description: item.description,
      imageurl: item.imageurls[0],
    }));
    return {
      name: Draw?.name,
      description: Draw?.description,
      execution
    }
  }
}
