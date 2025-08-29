import { Controller, Get, Param, Put, Query } from '@nestjs/common';
import { ExecutionService } from 'src/Execution/execution.service';
import { SearchService } from './search.service';

@Controller()
export class SearchController {
  constructor(private readonly searchService: SearchService) {}

  @Get()
  async GetAllNames() {}

}
