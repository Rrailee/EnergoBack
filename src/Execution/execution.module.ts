import { Module } from '@nestjs/common';
import { ExecutionService } from './execution.service';
import { ExecutionController } from './execution.controller';



@Module({
  imports: [],
  controllers: [ExecutionController],
  providers: [ExecutionService],
  exports: [ExecutionService]
})
export class ExecutionModule {}
