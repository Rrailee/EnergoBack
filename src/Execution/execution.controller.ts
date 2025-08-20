import { Controller, Get, Param } from '@nestjs/common';
import { Type } from '@prisma/client';
import { ExecutionService } from './execution.service';


@Controller()
export class ExecutionController {
  constructor(private readonly executionService: ExecutionService) {}

//   @Get("/gallery")
//   GetImages(@Param("ImageType") ImageType: Type ){
//     return this.Service.GetForType(ImageType)
//   }
  
}
