import { Module } from '@nestjs/common';
import { DrawingService } from './drawing.service';
import { DrawingController } from './drawing.controller';
import { ExecutionModule } from 'src/Execution/execution.module';


@Module({
  imports: [ExecutionModule],
  controllers: [DrawingController],
  providers: [DrawingService],
})
export class DrawingModule {}
