import { Controller, Get, Param } from '@nestjs/common';
import { ExecutionService } from 'src/Execution/execution.service';
import { SearchService } from './search.service';

@Controller('products')
export class SearchController {
  constructor(private readonly searchService: SearchService) {}

  @Get()
  async GetAllNames() {}
}
