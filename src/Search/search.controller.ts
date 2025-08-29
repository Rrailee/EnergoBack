import { Controller, Get, Param, Put, Query } from '@nestjs/common';
import { ExecutionService } from 'src/Execution/execution.service';
import { SearchService } from './search.service';

@Controller('search')
export class SearchController {
  constructor(private readonly searchService: SearchService) {}

  @Get()
  async GetAllNames(@Query('qu') qu: string) {
    if (!qu || qu.trim().length === 0) {
      return [];
    }
    
    const results = await this.searchService.MainSearch(qu.trim());
    return results.slice(0, 10);
  }
}
