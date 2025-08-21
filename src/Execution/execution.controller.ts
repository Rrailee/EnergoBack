import { Controller, Get, Param } from '@nestjs/common';
import { Type } from '@prisma/client';
import { ExecutionService } from './execution.service';

@Controller('products/:DrawName')
export class ExecutionController {
  constructor(private readonly executionService: ExecutionService) {}

  @Get(':ExecName')
  async GetByName(@Param('ExecName') Execname: string) {
    const res = await this.executionService.GetByName(Execname);
    const ExecTable = (await this.executionService.GetTableByID(res!.id)).map(item => ({
      name: item.name,
      mass: item.mass,
      price1: item.price1,
      price2: item.price2
    }))
    return {
      name: res?.name,
      description: res?.description,
      certificate: res?.certificate,
      modelurl: res?.model3durl,
      imageurls: res?.imageurls,
      ExecTable
    }
  }
}
