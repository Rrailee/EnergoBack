import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
import { GalleryModule } from './Gallery/gallery.module';

@Module({
  imports: [PrismaModule, GalleryModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
