import { Injectable } from '@nestjs/common';
import { ExecutionService } from 'src/Execution/execution.service';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class SearchService {
  constructor(private readonly prismaService: PrismaService,
    private readonly executionService: ExecutionService,
  ) {}

  MainSearch(qu: string) {
    const result = []


  }

}
