import { Module } from '@nestjs/common';
import { PrismaModule } from './prisma/prisma.module';
import { GalleryModule } from './Gallery/gallery.module';
import { DrawingModule } from './Drawing/drawing.module';
import { ExecutionModule } from './Execution/execution.module';

@Module({
  imports: [PrismaModule, GalleryModule, DrawingModule, ExecutionModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
