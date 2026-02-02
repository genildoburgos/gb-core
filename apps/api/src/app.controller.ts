import { Controller, Get, Res } from '@nestjs/common';
import { AppService } from './app.service';
import { Client } from 'pg';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Get('db')
  async checkDb(@Res() res) {
    const databaseUrl = process.env.DATABASE_URL;
    if (!databaseUrl)
      return res.status(500).json({ error: 'DATABASE_URL não configurado' });

    const client = new Client({ connectionString: databaseUrl });
    try {
      await client.connect();
      const result = await client.query('SELECT 1 as ok');
      await client.end();
      return res.json({ db: 'connected', result: result.rows });
    } catch (err: any) {
      return res.status(500).json({ db: 'error', message: err.message });
    }
  }
}
