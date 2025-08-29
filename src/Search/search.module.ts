import { Module } from '@nestjs/common';
import { SearchController } from './search.controller';
import { SearchService } from './search.service';
import { ExecutionModule } from 'src/Execution/execution.module';

@Module({
  imports: [ExecutionModule],
  controllers: [SearchController],
  providers: [SearchService],
})
export class SearchModule {}
