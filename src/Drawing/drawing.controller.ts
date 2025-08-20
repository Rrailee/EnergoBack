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
  GetImages() {
    return this.drawingService.GetAll();
  }

  @Get(':DrawName')
  async GetExecutions(@Param('DrawName') DrawName: string) {
    const DrawId = await this.drawingService.GetIdByName(DrawName);
    const res = await this.executionService.GetManyByDrawingId(DrawId!.id)

    return res.map(item => ({
        name: item.name,
        description: item.description,
        imageurl: item.imageurls[0]
    }))
  }
}
