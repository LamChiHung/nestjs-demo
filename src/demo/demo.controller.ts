import { Controller, Get, HttpStatus, Param, Query, Res } from '@nestjs/common';
import { Response } from 'express';

@Controller('demo')
export class DemoController {

    @Get(`:name/demo`)
    getHello(
        @Param('name') name: string,
        @Query('age') age: number,
        @Res() res: Response
    )
    {
        res.status(HttpStatus.OK).send({ name, age });
    }
}
