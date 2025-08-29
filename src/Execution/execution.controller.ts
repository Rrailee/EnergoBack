import { Controller, Get, Param, Post, Query } from '@nestjs/common';
import { Type } from '@prisma/client';
import { ExecutionService } from './execution.service';

@Controller('products/:DrawName')
export class ExecutionController {
  constructor(private readonly executionService: ExecutionService) {}

  @Get(':ExecName')
  async GetByName(@Param('ExecName') Execname: string) {
    const res = await this.executionService.GetByName(Execname);
    return {
      name: res?.name,
      description: res?.description,
      certificate: res?.certificate,
      modelurl: res?.model3durl,
      imageurls: res?.imageurls,
    };
  }

  @Post(':ExecName')

  async GetTable(
    @Param('ExecName') Execname: string,
    @Query('page') page: string = "1",
    @Query('limit') limit: string = "16",
    @Query('qu') qu: string = "",
  ) {
    const ExecId = await this.executionService.GetIdByName(Execname);
    const ExecTable = await this.executionService.GetTableByID(
      ExecId?.id!,
      parseInt(page),
      parseInt(limit),
      qu
    );
    return {
      data: ExecTable.data.map((item) => ({
        name: item.name,
        mass: item.mass,
        price1: item.price1,
        price2: item.price2,
      })),
      meta: ExecTable.meta,
    };
  }
}
