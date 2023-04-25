<?php

namespace App\Controller\Admin;

use App\Entity\Usure;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class UsureCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Usure::class;
    }

    /*
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id'),
            TextField::new('title'),
            TextEditorField::new('description'),
        ];
    }
    */
}
